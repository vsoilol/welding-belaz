import React from "react";
import { Calendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const CalendarPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Calendar {...props} />
      </HeaderLayout>
    </div>
  );
};
