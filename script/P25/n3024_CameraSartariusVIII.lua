-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 501.212280 , 247.256592 , 37.026669 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 505.699249 , 252.000443 , 37.026669 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 508.927094 , 255.413147 , 37.026669 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 511.820740 , 258.472534 , 37.026669 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
