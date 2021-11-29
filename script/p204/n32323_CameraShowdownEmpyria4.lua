-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 458.439056 , 232.811188 , 23.493196 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9895);]] )
   Camera:MotionSpline_AddSplinePoint( 458.439056 , 232.811188 , 23.493196 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 458.439056 , 232.811188 , 23.493196 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 458.439056 , 232.811188 , 23.493196 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
