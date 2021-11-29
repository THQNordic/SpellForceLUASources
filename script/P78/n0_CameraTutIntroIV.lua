-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 202.706482 , 560.988831 , 62.375580 , 30.300079 , [[Camera:ScriptSplineLookAtNpc(0);
   Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 202.392838 , 560.681702 , 62.495583 , 20.000040 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.017975 , 560.398315 , 62.495583 , 30.200079 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.615463 , 560.155640 , 62.595581 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
