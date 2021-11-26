export const getPhoneLink = (phone?: string) => {
  if (!phone) {
    return '';
  }

  return <a href={`tel:${phone}`}>{phone}</a>;
};
