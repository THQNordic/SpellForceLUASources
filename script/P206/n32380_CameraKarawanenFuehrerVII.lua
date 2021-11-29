-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 414.189941 , 627.222778 , 48.5 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8790);]] )
   Camera:MotionSpline_AddSplinePoint( 414.189941 , 627.222778 , 48.5 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 414.189941 , 627.222778 , 48.5 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 414.189941 , 627.222778 , 48.5 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
