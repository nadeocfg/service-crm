import { useState } from 'react';
import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from '@material-ui/core';
import Btn from '../Btn';
import Transition from '../Transition';
import AddIcon from '@material-ui/icons/Add';

const CreateRoleModal = () => {
  const [open, setOpen] = useState(false);
  const [roleData, setRoleData] = useState({
    code: '',
    name: '',
  });

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    setRoleData({
      ...roleData,
      [name]: event.target.value,
    });
  };

  const submit = () => {
    console.log(roleData);
  };

  return (
    <>
      <Btn classes="btn btn_primary" onClick={handleChangeModal}>
        <AddIcon />
        Добавить
      </Btn>

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Добавить роль</DialogTitle>
        <form id="role-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Код"
              variant="outlined"
              value={roleData.code}
              onChange={handleChange('code')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={roleData.name}
              onChange={handleChange('name')}
              required
            />
          </DialogContent>
          <DialogActions className="btn-container">
            <Btn classes="btn btn_white" onClick={handleChangeModal}>
              Отмена
            </Btn>
            <Btn classes="btn btn_primary" type="submit">
              Добавить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>
    </>
  );
};

export default CreateRoleModal;
