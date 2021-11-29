-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 272.000031 , 191.855026 , 27.558117 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 272.000031 , 191.855026 , 27.558117 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 272.000031 , 191.855026 , 27.558117 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 272.000031 , 191.855026 , 27.558117 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
