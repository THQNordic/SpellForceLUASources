-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 450.376953 , 347.606598 , 70.048439 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(510.949,408.529,20.910);]] )
   Camera:MotionSpline_AddSplinePoint( 475.444733 , 324.546112 , 68.828392 , 8.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 508.100128 , 319.485260 , 75.648430 , 11.600008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 531.483398 , 327.297577 , 80.468422 , 15.400023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 548.896667 , 350.429565 , 71.158012 , 18.000032 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 556.750732 , 369.404083 , 67.879120 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 552.809204 , 383.268219 , 70.908440 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
