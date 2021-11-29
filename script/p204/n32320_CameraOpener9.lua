-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 384.037689 , 435.667969 , 59.809986 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(8793);]] )
   Camera:MotionSpline_AddSplinePoint( 384.149445 , 431.672882 , 61.809986 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.972504 , 429.663269 , 65.809986 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.788910 , 428.653625 , 66.809982 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
