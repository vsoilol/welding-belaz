import React from "react";
import { BaseCalendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const CalendarPage = (props) => {
  return (
    <div>
      <HeaderLayout {...(props?.state?.auth?.user?.role ?? props?.userRole)}>
        <BaseCalendar {...props} />
      </HeaderLayout>
    </div>
  );
};
