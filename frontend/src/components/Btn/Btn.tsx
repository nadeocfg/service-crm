import { Button, ButtonBaseProps } from '@material-ui/core';
import { NavLink } from 'react-router-dom';

interface ButtonProps extends ButtonBaseProps {
  children: any;
  className?: string;
  onClick?: React.MouseEventHandler<HTMLButtonElement>;
  href?: string;
  disabled?: boolean;
  target?: string;
  to?: any;
  type?: 'button' | 'submit' | 'reset' | undefined;
  disableRipple?: boolean | undefined;
}

export default function Btn({
  to,
  children,
  className,
  disabled,
  onClick,
  type,
  disableRipple,
}: ButtonProps) {
  if (to) {
    return (
      <NavLink to={to} className={className}>
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
      className={className}
      type={type}
      disableRipple={disableRipple}
    >
      {children}
    </Button>
  );
}
