-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 281.581085 , 127.128922 , 21.029900 , 18.600035 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(2,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 281.581085 , 127.128922 , 21.029900 , 12.300011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 281.581085 , 127.128922 , 21.029900 , 18.500034 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 281.581085 , 127.128922 , 21.029900 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
