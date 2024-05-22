const validateEmail = (email) => {
  const re = /\S+@\S+\.\S+/;
  return re.test(email);
};

const validatePhoneNumber = (phoneNumber) => {
  const re = /^\+\d{1,3}\d{10}$/;
  return re.test(phoneNumber);
};

const validatePassword = (password) => {
  const re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,15}$/;
  return re.test(password);
};

module.exports = {
  validateEmail,
  validatePhoneNumber,
  validatePassword,
};
