import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import workplaceActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {

    LOAD_EQUIPMENT_REQUEST,
    ///Календарь 
    LOAD_CALENDARYEAR_REQUEST,
    ADD_CALENDARMAIN_REQUEST,
    EDIT_EDITCALENDAR_REQUEST,
    ADD_CALENDARWELDER_REQUEST,
    LOAD_CALENDARWELDER_REQUEST,
    ADD_CALENDAREQUIPMENT_REQUEST,
    LOAD_CALENDAREQUIPMENT_REQUEST,
    ///Executor
    LOAD_EXECUTORS_REQUEST,
    ////WorkingShift
    EDIT_SHIFT_REQUEST,
    ADD_SHIFT_REQUEST,
    ////Day
    LOAD_DAYEQUI_REQUEST,
    LOAD_DAYBYWELDER_REQUEST,
    EDIT_DAY_REQUEST,
    ADD_DAY_REQUEST,
  },
  Creators: {
    ///Календарь 
    loadCalendaryearSuccess,
    loadCalendaryearFailure,

    addCalendarmainSuccess,
    addCalendarmainFailure,

    editEditcalendarSuccess,
    editEditcalendarFailure,

    addCalendarwelderSuccess,
    addCalendarwelderFailure,

    loadCalendarwelderSuccess,
    loadCalendarwelderFailure,

    addCalendarequipmentSuccess,
    addCalendarequipmentFailure,

    loadCalendarequipmentSuccess,
    loadCalendarequipmentFailure,

    ///Executor
    loadExecutorsSuccess,
    loadExecutorsFailure,

    ///Equipment
    loadEquipmentSuccess,
    loadEquipmentFailure,


    ////WorkingShift
    editShiftSuccess,
    editShiftFailure,

    addShiftSuccess,
    addShiftFailure,


    ////Day
    editDaySuccess,
    editDayFailure,

    addDaySuccess,
    addDayFailure,

    loadDayequiSuccess,
    loadDayequiFailure


  },
} = workplaceActions;

const {
  Creators: { setError },
} = errorActions;
///Календарь 
function* loadCalendaryear(date) {
  try {
    const { data } = yield call(api.get, `/calendar/main/${date.payload}`);
    yield put(loadCalendaryearSuccess(data));
  } catch (error) {
    yield put(loadCalendaryearFailure(error));
    yield put(setError(error.message));
  }
}
function* addCalendarmain({ payload }) {
  try {
    const { data } = yield call(api.post, `/calendar/main`, {
      "year": 2023,
      "mainWorkingShift": [
        {
          "number": 1,
          "shiftStart": "11:30",
          "shiftEnd": "11:30",
          "breakStart": "11:30",
          "breakEnd": "11:30"
        }
      ],
      "days": [
        {
          "monthNumber": 1,
          "number": 24,
          "isWorkingDay": true,
          "workingShifts": [
            {
              "number": 1,
              "shiftStart": "11:30",
              "shiftEnd": "11:30",
              "breakStart": "11:30",
              "breakEnd": "11:30"
            }
          ]
        }
      ]
    });
    yield put(addCalendarmainSuccess(data));
  } catch (error) {
    yield put(addCalendarmainFailure(error));
    yield put(setError(error.message));
  }
}
function* editEditcalendar({ payload }) {
  try {
    console.log({
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "year": 0
    })
    // const { data } = yield call(api.put, `/calendar`, {
    //   "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    //   "year": 0
    // });  
    // yield put(editEditcalendarSuccess(data));
  } catch (error) {
    yield put(editEditcalendarFailure(error));
    yield put(setError(error.message));
  }
}
function* addCalendarwelder({ payload }) {
  try {
    console.log({
      "year": 0,
      "welderId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "mainWorkingShift": [
        {
          "number": 0,
          "shiftStart": "string",
          "shiftEnd": "string",
          "breakStart": "string",
          "breakEnd": "string"
        }
      ],
      "days": [
        {
          "monthNumber": 0,
          "number": 0,
          "isWorkingDay": true,
          "workingShifts": [
            {
              "number": 0,
              "shiftStart": "string",
              "shiftEnd": "string",
              "breakStart": "string",
              "breakEnd": "string"
            }
          ]
        }
      ]
    })

    // const { data } = yield call(api.post, `/calendar/withWelder`, {
    //   "year": 0,
    //   "welderId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    //   "mainWorkingShift": [
    //     {
    //       "number": 0,
    //       "shiftStart": "string",
    //       "shiftEnd": "string",
    //       "breakStart": "string",
    //       "breakEnd": "string"
    //     }
    //   ],
    //   "days": [
    //     {
    //       "monthNumber": 0,
    //       "number": 0,
    //       "isWorkingDay": true,
    //       "workingShifts": [
    //         {
    //           "number": 0,
    //           "shiftStart": "string",
    //           "shiftEnd": "string",
    //           "breakStart": "string",
    //           "breakEnd": "string"
    //         }
    //       ]
    //     }
    //   ]
    // }); 
    // yield put(addCalendarwelderSuccess(data)); 
  } catch (error) {
    yield put(addCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}
function* loadCalendarwelder() {
  try {
    console.log("ads")
    // const { data } = yield call(api.get, `/calendar/byWelde`);
    // console.log(data)
    // yield put(loadCalendarwelderSuccess(data));
  } catch (error) {
    yield put(loadCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}
function* addCalendarequipment({ payload }) {
  try {
    console.log({
      "year": 0,
      "weldingEquipmentId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "mainWorkingShift": [
        {
          "number": 0,
          "shiftStart": "string",
          "shiftEnd": "string",
          "breakStart": "string",
          "breakEnd": "string"
        }
      ],
      "days": [
        {
          "monthNumber": 0,
          "number": 0,
          "isWorkingDay": true,
          "workingShifts": [
            {
              "number": 0,
              "shiftStart": "string",
              "shiftEnd": "string",
              "breakStart": "string",
              "breakEnd": "string"
            }
          ]
        }
      ]
    })

    // const { data } = yield call(api.post, `/calendar/withEquipment`, {
    //   "year": 0,
    //   "weldingEquipmentId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    //   "mainWorkingShift": [
    //     {
    //       "number": 0,
    //       "shiftStart": "string",
    //       "shiftEnd": "string",
    //       "breakStart": "string",
    //       "breakEnd": "string"
    //     }
    //   ],
    //   "days": [
    //     {
    //       "monthNumber": 0,
    //       "number": 0,
    //       "isWorkingDay": true,
    //       "workingShifts": [
    //         {
    //           "number": 0,
    //           "shiftStart": "string",
    //           "shiftEnd": "string",
    //           "breakStart": "string",
    //           "breakEnd": "string"
    //         }
    //       ]
    //     }
    //   ]
    // }); 
    // yield put(addCalendarwelderSuccess(data)); 
  } catch (error) {
    yield put(addCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}
function* loadCalendarequipment() {
  try {
    console.log("ads")
    // const { data } = yield call(api.get, `/calendar/byEquipment`);
    // console.log(data)
    // yield put(loadCalendarequipmentSuccess(data));
  } catch (error) {
    yield put(loadCalendarequipmentFailure(error));
    yield put(setError(error.message));
  }
}
///Executor
// function* loadExecutors() {
//   try {
//     const { data } = yield call(api.get, `/welder`);  
//     yield put(loadExecutorsSuccess(data)); 
//   } catch (error) {
//     yield put(loadExecutorsFailure(error));
//     yield put(setError(error.message));
//   }
// }
///Equipment
// function* loadEquipment() { 
//   try {
//     const { data } = yield call(api.get, `/WeldingEquipment`);
//     const downtime = yield call(api.get, `/WeldingEquipment/downtime`);
//     let data_equipment = [data, downtime.data]
 
//     yield put(loadEquipmentSuccess(data_equipment)); 
//   } catch (error) {
//     yield put(loadEquipmentFailure(error));
//     yield put(setError(error.message));
//   }
// }


///WorkingShift
function* addShift({ payload }) {
  try {  

    const { data } = yield call(api.post, `/workingShift`, {
      "number": payload.shiftNumb,
      "shiftStart": payload.shiftStart,
      "shiftEnd": payload.shiftEnd,
      "breakStart": payload.breakStart,
      "breakEnd": payload.breakEnd,
      "year": 2023,
      "dayId": null
    }); 
    window.location.reload()
    yield put(addShiftSuccess(data)); 
  } catch (error) {
    yield put(addShiftFailure(error));
    yield put(setError(error.message));
  }
}

function* editShift({ payload }) {
  try { 
   
    // console.log({
    //   "id": payload.daiID,
    //   "monthNumber": payload.monthNumber,
    //   "number": payload.number,
    //   "isWorkingDay": true,
    //   "year": 2023
    // })
    // const { data } = yield call(api.put, `/workingShift`, {
    //   "id": payload.daiID,
    //   "monthNumber": payload.monthNumber,
    //   "number": payload.number,
    //   "isWorkingDay": true,
    //   "year": 2023
    // });  
    
    // window.location.reload()
    // yield put(editShiftSuccess(data));
  } catch (error) {
    yield put(editShiftFailure(error));
    yield put(setError(error.message));
  }
}


///Day
function* addDay({ payload }) {
  try {

    if (payload.calendarId == "") {
      // const { data } = yield call(api.post, `/calendar/main`, {
      //   "year": new Date(payload.workDay).getFullYear(),
      //   "mainWorkingShift": [
      //     {
      //       "number": payload.WorkingShiftnumber,
      //       "shiftStart": payload.shiftStart,
      //       "shiftEnd": payload.shiftEnd,
      //       "breakStart": payload.breakStart,
      //       "breakEnd": payload.breakEnd
      //     }
      //   ],
      //   "days": [
      //     {
      //       "monthNumber": payload.monthNumber,
      //       "number": payload.number,
      //       "isWorkingDay": payload.isWorkingDay,
      //       "workingShifts": [
      //         {
      //           "number": payload.WorkingShiftnumber,
      //           "shiftStart": payload.shiftStart,
      //           "shiftEnd": payload.shiftEnd,
      //           "breakStart": payload.breakStart,
      //           "breakEnd": payload.breakEnd
      //         }
      //       ]

      //     }
      //   ]
      // }); 
    }
    else {
      const { data } = yield call(api.post, `/day`, {
        "monthNumber": payload.monthNumber,
        "number": payload.number,
        "isWorkingDay": true,
        "year": payload.year,
        "weldingEquipmentId": payload.valueEquipment,
        "welderId": payload.valueExecutors,
        "workingShifts": [
          {
            "number": payload.workingShifts.number,
            "shiftStart": payload.workingShifts.shiftStart,
            "shiftEnd": payload.workingShifts.shiftEnd,
            "breakStart": payload.workingShifts.breakStart,
            "breakEnd": payload.workingShifts.breakEnd
          }
        ]
      });
      window.location.reload()
    }
    // yield put(addDaySuccess(data)); 
  } catch (error) {
    yield put(addDayFailure(error));
    yield put(setError(error.message));
  }



}

function* editDay({ payload }) {
  try { 
      const { data } = yield call(api.put, `/day`, {
        "id": payload.daiID,
        "monthNumber": payload.monthNumber,
        "number": payload.number,
        "isWorkingDay": true,
        "year": 2023
      });  
      
      window.location.reload()
    // yield put(editDaySuccess(data));
  } catch (error) {
    yield put(editDayFailure(error));
    yield put(setError(error.message));
  }
}



/// Day by  Welder
function* loadDayByWelder({ payload }) {
  try {  
    const { data } = yield call(api.get, `/day/byWelder/${payload}`); 
    yield put(addDaySuccess(data)); 
  } catch (error) {
    yield put(addDayFailure(error));
    yield put(setError(error.message));
  }



}
function* loadDayByEquipment({ payload }) {
  try {  
  
    const { data } = yield call(api.get, `/day/byEquipment/${payload}`);  
    yield put(loadDayequiSuccess(data)); 
  } catch (error) {
    yield put(loadDayequiFailure(error));
    yield put(setError(error.message));
  } 
}
export function* CalendarSaga() {
  ///Календарь 
  yield takeLatest(LOAD_CALENDARYEAR_REQUEST, loadCalendaryear);
  yield takeLatest(ADD_CALENDARMAIN_REQUEST, addCalendarmain);
  yield takeLatest(EDIT_EDITCALENDAR_REQUEST, editEditcalendar);
  yield takeLatest(ADD_CALENDARWELDER_REQUEST, addCalendarwelder);
  yield takeLatest(LOAD_CALENDARWELDER_REQUEST, loadCalendarwelder);
  yield takeLatest(ADD_CALENDAREQUIPMENT_REQUEST, addCalendarequipment);
  yield takeLatest(LOAD_CALENDAREQUIPMENT_REQUEST, loadCalendarequipment);

  ///Executor
  // yield takeLatest(LOAD_EXECUTORS_REQUEST, loadExecutors);
  ///Equipment
  // yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);

  ///WorkingShift

  yield takeLatest(ADD_SHIFT_REQUEST, addShift);
  yield takeLatest(EDIT_SHIFT_REQUEST, editShift);

  ///Day
  yield takeLatest(LOAD_DAYBYWELDER_REQUEST, loadDayByWelder);
  yield takeLatest(LOAD_DAYEQUI_REQUEST, loadDayByEquipment);

  yield takeLatest(ADD_DAY_REQUEST, addDay);
  yield takeLatest(EDIT_DAY_REQUEST, editDay);
}


