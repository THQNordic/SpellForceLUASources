-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 549.296082 , 518.307739 , 70.198952 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(559.859,533.366,70.312);]] )
   Camera:MotionSpline_AddSplinePoint( 550.707214 , 517.076782 , 70.548927 , 15.400023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 553.514526 , 514.585144 , 71.701187 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.486328 , 517.693054 , 72.498947 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
