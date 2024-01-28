import { GLOBALS } from "config/GLOBALS";

export default {
  menu: (styles, state) => ({
    ...styles,
    backgroundColor: `white`,
    borderRadius: "2px",
    boxShadow: "none",
    border: "1px solid #d8d8d8",
    zIndex: 12,
  }),

  control: (styles, state) => ({
    ...styles,
    fontFamily: "Muller Narrow Light",
    fontSize: "14px",
    fontWeight: "500px",
    lineHeight: "21px",
    borderRadius: "19px",
    border: state.isFocused ? 0 : 0,
    boxShadow: state.isFocused ? 0 : 0,
    "&:hover": {
      border: state.isFocused ? 0 : 0,
    },
    height: "100%",
  }),

  option: (styles, { data, isDisabled, isFocused, isSelected }) => {
    return {
      ...styles,
      color: "#000000",
      backgroundColor: `#ffffff`,
      fontFamily: "Muller Narrow Light",
      fontSize: "16px",
      fontWeight: "500",
      lineHeight: "21px",
      paddingLeft: 40,
      cursor: "pointer",
      ":active": {
        ...styles[":active"],
        backgroundColor: isSelected && GLOBALS.COLORS.PRIMARY_COLOR,
        color: isSelected && `#ffffff`,
      },
      ":hover": {
        ...styles[":hover"],
        fontWeight: "600",
      },
    };
  },

  input: (styles) => ({
    ...styles,
    margin: "0",
    padding: "0",
    paddingLeft: "10px",
    color: `#000000`,
    fontFamily: "Muller Narrow Light",
    fontSize: "16px",
    fontWeight: "300px",
    lineHeight: "21px",
  }),

  placeholder: (styles) => ({
    ...styles,
    margin: "0",
    padding: "0",
    paddingLeft: "10px",
    fontFamily: "Muller Narrow Light",
    fontSize: "16px",
    fontWeight: "300px",
    lineHeight: "21px",
    color: "#000000",
  }),

  noOptionsMessage: (styles) => ({
    ...styles,
    fontFamily: "Muller Narrow Light",
    fontSize: "16px",
    fontWeight: "300px",
    lineHeight: "21px",
    color: "#d8d8d8",
  }),
};
