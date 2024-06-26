import React from "react";
import { Executors } from "components";
import { HeaderLayout } from "layouts/Header";

export const ExecutorsPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Executors {...props} />
      </HeaderLayout>
    </div>
  );
};
