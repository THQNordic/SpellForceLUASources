-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 97.249481 , 21.115194 , 32.116402 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 97.356354 , 67.652626 , 32.116402 , 16.600027 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 96.291519 , 111.280670 , 32.116402 , 24.800058 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 97.219131 , 160.023682 , 32.116402 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
