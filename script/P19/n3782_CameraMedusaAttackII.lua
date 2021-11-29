-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 290.685181 , 102.962479 , 54.524792 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(4190);]] )
   Camera:MotionSpline_AddSplinePoint( 290.685181 , 102.962479 , 54.524792 , 5.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 290.685181 , 102.962479 , 54.524792 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 290.685181 , 102.962479 , 54.524792 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
