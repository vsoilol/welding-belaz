import React from "react";
import { Equipment } from "components";
import { HeaderLayout } from "layouts/Header";

export const EquipmentPage = props => {
  return (
    <div>
      <HeaderLayout >
        <Equipment {...props} />
      </HeaderLayout>

      
    </div>
  );
};
