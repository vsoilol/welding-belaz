import React from "react";
import { Reports } from "components";
import { HeaderLayout } from "layouts/Header";

export const ReportsPage = props => {
  console.log(props)
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Reports {...props} />
      </HeaderLayout>
    </div>
  );
};
