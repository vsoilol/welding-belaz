import React from "react";
import { Tasks } from "components";
import { HeaderLayout } from "layouts/Header";

export const TasksPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Tasks {...props} />
      </HeaderLayout>
    </div>
  );
};
