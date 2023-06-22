import React from "react";
import { Production_calendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const ProductionCalendar = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Production_calendar {...props} />
      </HeaderLayout>
    </div>
  );
};
