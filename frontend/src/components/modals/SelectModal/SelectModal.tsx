import {
  Dialog,
  DialogContent,
  DialogTitle,
  InputBase,
  InputAdornment,
  List,
  ListItem,
  ListItemText,
  ListItemSecondaryAction,
} from '@material-ui/core';
import Transition from '../../Transition';
import SearchIcon from '@material-ui/icons/Search';
import { useEffect, useRef, useState } from 'react';

declare global {
  interface Window {
    delay: any;
  }
}

interface SelectModalProps {
  open: boolean;
  onSelect: Function;
  title: string;
  handleChangeModal: any;
  items: any[];
  handleChange: any;
  fieldName: string;
}

const SelectModal = ({
  open,
  handleChangeModal,
  onSelect,
  title,
  items,
  handleChange,
  fieldName,
}: SelectModalProps) => {
  let isOpen = useRef(open);
  const [searchValue, setSearchValue] = useState('');

  useEffect(() => {
    if (isOpen.current !== open) {
      isOpen.current = open;

      if (isOpen.current) {
        handleChange();
        setSearchValue('');
      }
    }
  }, [open, handleChange]);

  const onChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (typeof window.delay !== 'undefined') {
      clearTimeout(window.delay);
    }

    window.delay = setTimeout(() => {
      handleChange(event.target.value);
    }, 500);

    setSearchValue(event.target.value);
  };

  const onClick = (fieldName: string, el: any) => {
    onSelect(fieldName, el);
    handleChangeModal();
  };

  return (
    <>
      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
        fullWidth={true}
      >
        <DialogTitle>{title || ''}</DialogTitle>
        <DialogContent className="select-modal">
          <InputBase
            onChange={onChange}
            value={searchValue}
            placeholder="Введите параметры поиска"
            inputProps={{ 'aria-label': 'Введите параметры поиска' }}
            startAdornment={
              <InputAdornment position="start">
                <SearchIcon />
              </InputAdornment>
            }
            fullWidth={true}
          />

          <List>
            {items.map((el, index) => (
              <ListItem
                button
                alignItems="flex-start"
                onClick={() => onClick(fieldName, el)}
                key={index}
              >
                <ListItemText
                  primary={el.fullName || el.name}
                  secondary={el.phone || el.article || el.code}
                />

                {el.price && (
                  <ListItemSecondaryAction>
                    <h3>{`${el.price} тг`}</h3>
                  </ListItemSecondaryAction>
                )}
              </ListItem>
            ))}
          </List>
        </DialogContent>
      </Dialog>
    </>
  );
};

export default SelectModal;
