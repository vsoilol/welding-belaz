import React from "react";
import { Reports } from "components";
import { HeaderLayout } from "layouts/Header";

export const ReportsPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Reports {...props} />
      </HeaderLayout>
    </div>
  );
};