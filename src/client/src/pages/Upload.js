import React from "react";
import { Upload } from "components";
import { HeaderLayout } from "layouts/Header";

export const UploadPage = props => {
  return (
    <div>
      <HeaderLayout>
        <Upload  />
      </HeaderLayout>
    </div>
  );
}; 