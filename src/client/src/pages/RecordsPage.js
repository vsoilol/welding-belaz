import React from "react";
import { Records } from "components";
import { HeaderLayout } from "layouts/Header";

export const RecordsPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Records {...props} />
      </HeaderLayout>
    </div>
  );
};
