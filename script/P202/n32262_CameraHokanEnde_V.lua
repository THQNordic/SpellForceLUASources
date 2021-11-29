-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 536.951782 , 139.655624 , 7.741320 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 533.869324 , 138.860092 , 7.771308 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 530.017822 , 137.949921 , 7.771314 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 526.079163 , 137.278214 , 7.811308 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
