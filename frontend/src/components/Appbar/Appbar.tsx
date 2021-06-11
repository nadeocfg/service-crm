import {
  AppBar,
  Collapse,
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
import HomeOutlinedIcon from '@material-ui/icons/HomeOutlined';
import { useDispatch, useSelector } from 'react-redux';
import { logout } from '../../store/actions/userActions';
import { changeDrawer } from '../../store/actions/mainActions';
import { StoreModel } from '../../models/storeModel';
import PeopleAltOutlinedIcon from '@material-ui/icons/PeopleAltOutlined';
import { useHistory, useLocation } from 'react-router';
import { adminRoutes, routes } from '../../utils/routes';
import ExpandLess from '@material-ui/icons/ExpandLess';
import ExpandMore from '@material-ui/icons/ExpandMore';
import { useState } from 'react';
import SettingsIcon from '@material-ui/icons/Settings';
import GroupIcon from '@material-ui/icons/Group';
import WorkIcon from '@material-ui/icons/Work';
import BathtubIcon from '@material-ui/icons/Bathtub';
import ExtensionIcon from '@material-ui/icons/Extension';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import PlaylistAddCheckIcon from '@material-ui/icons/PlaylistAddCheck';

const Appbar = () => {
  const open = useSelector((state: StoreModel) => state.mainStore.isDrawerOpen);
  const dispatch = useDispatch();
  const history = useHistory();
  const location = useLocation();
  const [openSubMenu, setOpenSubMenu] = useState(false);

  const handleOpenSubmenu = () => {
    setOpenSubMenu(!openSubMenu);
  };

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

        <List className="menu">
          {routes.map((route, index) => (
            <ListItem
              key={index}
              button
              onClick={() => navigateTo(route.path)}
              selected={location.pathname === route.path}
              className={
                location.pathname === route.path
                  ? 'menu__item menu__item_selected'
                  : 'menu__item'
              }
            >
              <ListItemIcon>
                {route.code === 'home' && <HomeOutlinedIcon />}
                {route.code === 'users' && <PeopleAltOutlinedIcon />}
                {route.code === 'orders' && <ShoppingCartIcon />}
              </ListItemIcon>
              <ListItemText primary={route.name} />
            </ListItem>
          ))}

          <ListItem button onClick={handleOpenSubmenu}>
            <ListItemIcon>
              <SettingsIcon />
            </ListItemIcon>
            <ListItemText primary="Администрирование" />
            {openSubMenu ? <ExpandLess /> : <ExpandMore />}
          </ListItem>
          <Collapse in={openSubMenu} unmountOnExit>
            <List component="div" disablePadding className="menu__nested">
              {adminRoutes.map((route, index) => (
                <ListItem
                  key={index}
                  button
                  onClick={() => navigateTo(route.path)}
                  selected={location.pathname === route.path}
                  className={
                    location.pathname === route.path
                      ? 'menu__item menu__item_selected'
                      : 'menu__item'
                  }
                >
                  <ListItemIcon>
                    {route.code === 'dictRoles' && <GroupIcon />}
                    {route.code === 'dictJobTypes' && <WorkIcon />}
                    {route.code === 'dictBoilers' && <BathtubIcon />}
                    {route.code === 'dictParts' && <ExtensionIcon />}
                    {route.code === 'dictOrderStatuses' && (
                      <PlaylistAddCheckIcon />
                    )}
                  </ListItemIcon>
                  <ListItemText primary={route.name} />
                </ListItem>
              ))}
            </List>
          </Collapse>
        </List>
      </Drawer>
    </>
  );
};

export default Appbar;
