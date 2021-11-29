-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 129.431534 , 156.434433 , 74.136452 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(136.923,181.338,55.480);]] )
   Camera:MotionSpline_AddSplinePoint( 137.861023 , 156.434402 , 72.597282 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 146.289993 , 156.434402 , 70.017601 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 154.730484 , 156.434402 , 76.056396 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
