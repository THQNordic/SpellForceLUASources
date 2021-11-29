-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 418.059052 , 322.369720 , 45.418106 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(402.952,334.607,15.180);]] )
   Camera:MotionSpline_AddSplinePoint( 418.059052 , 322.369720 , 45.418106 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(402.952,334.607,15.180););]] )
   Camera:MotionSpline_AddSplinePoint( 418.059052 , 322.369720 , 45.418106 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(402.952,334.607,15.180);]] )
   Camera:MotionSpline_AddSplinePoint( 418.059052 , 322.369720 , 45.418106 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(402.952,334.607,15.180);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
