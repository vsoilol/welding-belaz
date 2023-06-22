import React from "react";
import { Calendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const CalendarPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Calendar {...props} />
      </HeaderLayout>
    </div>
  );
};
