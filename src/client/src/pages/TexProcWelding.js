import React from "react";
import { TexProcWelding } from "components";
import { HeaderLayout } from "layouts/Header";

export const TexProcWeldingPage = props => {
  return (
    <div>
      <HeaderLayout {...props?.state?.auth?.user?.role??props?.userRole}>
        <TexProcWelding {...props} />
      </HeaderLayout>

      
    </div>
  );
};
