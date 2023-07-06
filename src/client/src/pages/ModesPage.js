import React from "react";
import { Modes } from "components";
import { HeaderLayout } from "layouts/Header";

export const ModesPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Modes {...props} />
      </HeaderLayout>
    </div>
  );
};
