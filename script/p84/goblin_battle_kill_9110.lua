-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 157.595947 , 128.414444 , 13.256855 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(163.636,130.108,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 157.595947 , 128.414444 , 13.256855 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.595947 , 128.414444 , 13.256855 , 9.199999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.595947 , 128.414444 , 13.256855 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
