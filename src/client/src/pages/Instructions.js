import React from "react";
import { Instructions } from "components";
import { HeaderLayout } from "layouts/Header";

export const InstructionsPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Instructions {...props} />
      </HeaderLayout>
    </div>
  );
};
