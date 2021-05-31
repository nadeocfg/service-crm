import { useDispatch } from 'react-redux';
import Btn from '../../components/Btn';
import { logout } from '../../store/actions/userActions';

const Home = () => {
  const dispatch = useDispatch();

  const initLogout = () => {
    dispatch(logout());
  };

  return (
    <div>
      <h1>Home</h1>

      <Btn onClick={initLogout}>Logout</Btn>
    </div>
  );
};

export default Home;
