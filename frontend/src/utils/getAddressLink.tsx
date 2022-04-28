export const getAddressLink = (address?: string) => {
  if (!address) {
    return '~';
  }

  return (
    <a
      href={`https://2gis.kz/almaty/search/${address}`}
      target="_blank"
      rel="noreferrer"
    >
      {address}
    </a>
  );
};
