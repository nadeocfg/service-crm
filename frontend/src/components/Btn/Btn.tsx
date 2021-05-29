import { Button } from '@material-ui/core';
import { NavLink } from 'react-router-dom';

interface ButtonProps {
  children: any;
  classes?: string;
  onClick?: React.MouseEventHandler<HTMLButtonElement>;
  href?: string;
  disabled?: boolean;
  target?: string;
  to?: any;
  type?: 'button' | 'submit' | 'reset' | undefined;
}

export default function Btn({
  to,
  children,
  classes,
  disabled,
  onClick,
  type,
}: ButtonProps) {
  if (to) {
    return (
      <NavLink to={to} className={classes}>
        {children}
      </NavLink>
    );
  }

  return (
    <Button
      variant="contained"
      disableElevation
      onClick={onClick}
      disabled={disabled}
      className={classes}
      type={type}
    >
      {children}
    </Button>
  );
}
