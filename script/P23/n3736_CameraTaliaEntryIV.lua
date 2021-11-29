-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 251.303711 , 355.171387 , 24.984081 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 287.547089 , 351.574524 , 24.473690 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 316.037292 , 341.081055 , 24.845760 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 340.702454 , 333.480377 , 24.533241 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.071686 , 327.022064 , 24.584080 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
