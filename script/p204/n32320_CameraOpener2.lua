-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 389.959106 , 446.512329 , 58.390965 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8793);]] )
   Camera:MotionSpline_AddSplinePoint( 389.791504 , 445.271179 , 58.390965 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 388.951599 , 444.356415 , 58.390965 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 388.105591 , 443.885590 , 58.390965 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 18.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
