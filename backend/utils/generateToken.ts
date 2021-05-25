import jwt from 'jsonwebtoken';

const generateJwt = (id: string) => {
  return jwt.sign({ id }, process.env.JWT_SECRET || '', {
    expiresIn: '3d',
  });
};

export default generateJwt;
