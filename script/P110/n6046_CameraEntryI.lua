-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 68.619003 , 516.607422 , 60.156513 , 6.099997 , [[Camera:ScriptSplineLookAtNpc(5994);]] )
   Camera:MotionSpline_AddSplinePoint( 68.330658 , 505.185455 , 60.096508 , 3.699999 , [[Camera:ScriptSplineLookAtNpc(5994);]] )
   Camera:MotionSpline_AddSplinePoint( 68.043442 , 493.769135 , 60.046387 , 5.999997 , [[Camera:ScriptSplineLookAtNpc(5994);]] )
   Camera:MotionSpline_AddSplinePoint( 67.229599 , 479.770721 , 59.906555 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5994);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
