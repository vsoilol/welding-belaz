import React from "react";
import { Tasks } from "components";
import { HeaderLayout } from "layouts/Header";

export const TasksPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Tasks {...props} />
      </HeaderLayout>
    </div>
  );
};
