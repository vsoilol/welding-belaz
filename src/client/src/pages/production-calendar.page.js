import React from "react";
import { ProductionCalendar } from "components";
import { HeaderLayout } from "layouts/Header";

export const ProductionCalendarPage = (props) => {
  return (
    <div>
      <HeaderLayout>
        <ProductionCalendar {...props} />
      </HeaderLayout>
    </div>
  );
};
