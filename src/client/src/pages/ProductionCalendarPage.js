import React from "react";
import { ProductionCalendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const ProductionCalendarPage = (props) => {
  return (
    <div>
      <HeaderLayout {...(props?.state?.auth?.user?.role ?? props?.userRole)}>
        <ProductionCalendar {...props} />
      </HeaderLayout>
    </div>
  );
};
