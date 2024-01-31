import { useSelector } from 'react-redux';
import { selectUserRole } from './auth.selectors';

export const useAuthStore = () => {
  // Selectors
  const userRole = useSelector(selectUserRole);

  return {
    userRole,
  };
};
