import React from "react";
import { Messags } from "components";
import { HeaderLayout } from "layouts/Header";

export const MessagesPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <Messags {...props} />
      </HeaderLayout>
    </div>
  );
};
