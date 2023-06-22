import React from "react";
import { WorkPlace } from "components";
import { HeaderLayout } from "layouts/Header";

export const WorkPlacePage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <WorkPlace {...props} />
      </HeaderLayout>

      
    </div>
  );
};
