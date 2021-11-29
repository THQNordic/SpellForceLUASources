-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 139.527100 , 663.030273 , 82.566208 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(164.651,634.016,54.850);]] )
   Camera:MotionSpline_AddSplinePoint( 139.527100 , 663.030273 , 82.566208 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 139.527100 , 663.030273 , 82.566208 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 139.527100 , 663.030273 , 82.566208 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
