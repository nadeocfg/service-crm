import {
  AppBar,
  Divider,
  Drawer,
  IconButton,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Toolbar,
  Typography,
} from '@material-ui/core';
import MenuIcon from '@material-ui/icons/Menu';
import Logo from '../../assets/images/logo.png';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import { useDispatch, useSelector } from 'react-redux';
import { logout } from '../../store/actions/userActions';
import { changeDrawer } from '../../store/actions/mainActions';
import { StoreModel } from '../../models/storeModel';
import PeopleAltOutlinedIcon from '@material-ui/icons/PeopleAltOutlined';
import { useHistory } from 'react-router';

const Appbar = () => {
  const open = useSelector((state: StoreModel) => state.mainStore.isDrawerOpen);
  const dispatch = useDispatch();
  const history = useHistory();

  const handleChange = () => {
    dispatch(changeDrawer(!open));
  };

  const navigateTo = (path: string) => {
    history.push(path);
  };

  const initLogout = () => {
    dispatch(logout());
  };

  return (
    <>
      <AppBar position="fixed" className="appbar">
        <Toolbar disableGutters={true}>
          <IconButton
            color="inherit"
            aria-label="open drawer"
            edge="start"
            className="open-drawer-btn"
            onClick={handleChange}
          >
            <MenuIcon />
          </IconButton>

          <Typography variant="h6" noWrap>
            Service center
          </Typography>

          <div className="right-side">
            <IconButton
              color="inherit"
              aria-label="open drawer"
              edge="start"
              onClick={initLogout}
            >
              <ExitToAppIcon />
            </IconButton>
          </div>
        </Toolbar>
      </AppBar>

      <Drawer
        variant="persistent"
        anchor="left"
        open={open}
        className={open ? 'drawer drawer_open' : 'drawer'}
      >
        <img src={Logo} alt="z-star" className="logo" />

        <Divider />

        <List>
          <ListItem button onClick={() => navigateTo('users')}>
            <ListItemIcon>
              <PeopleAltOutlinedIcon />
            </ListItemIcon>
            <ListItemText primary={'Пользователи'} />
          </ListItem>
        </List>
      </Drawer>
    </>
  );
};

export default Appbar;
