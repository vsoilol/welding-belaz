import React from "react";
import { TexProcWelding } from "components";
import { HeaderLayout } from "layouts/Header";

export const TexProcWeldingPage = props => {
  return (
    <div>
      <HeaderLayout>
        <TexProcWelding {...props} />
      </HeaderLayout>

      
    </div>
  );
};
