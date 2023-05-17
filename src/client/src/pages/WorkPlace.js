import React from "react";
import { WorkPlace } from "components";
import { HeaderLayout } from "layouts/Header";

export const WorkPlacePage = props => {
  return (
    <div>
      <HeaderLayout>
        <WorkPlace {...props} />
      </HeaderLayout>

      
    </div>
  );
};
