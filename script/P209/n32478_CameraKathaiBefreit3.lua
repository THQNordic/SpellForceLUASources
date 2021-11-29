-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 510.506287 , 349.782104 , 22.466499 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8587);]] )
   Camera:MotionSpline_AddSplinePoint( 510.506287 , 349.782104 , 22.466499 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8587);]] )
   Camera:MotionSpline_AddSplinePoint( 510.506287 , 349.782104 , 22.466499 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8587);]] )
   Camera:MotionSpline_AddSplinePoint( 510.506287 , 349.782104 , 22.466499 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8587);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
