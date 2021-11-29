-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 199.042358 , 295.755798 , 31.449600 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.882,299.125,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 199.042358 , 295.755798 , 31.449600 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.882,299.125,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 199.042358 , 295.755798 , 31.449600 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.882,299.125,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 199.042358 , 295.755798 , 31.449600 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.882,299.125,30.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
